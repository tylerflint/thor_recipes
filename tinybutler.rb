class Tinybutler < Thor
  
  desc "new", "create a new client project"
  def new
    client_name = ask "Client name or identifier"
    prepare_git( client_name )
    # start cloud server instance
    
    # setup cloud server instance
    
  end
  
protected
  
  def prepare_git(name, app_dir="", db_dump="")
    app_dir = ask "app source directory:" if app_dir == ""
    db_dump = ask "db dump:" if db_dump == ""
    
    # application
    `git push origin origin:refs/heads/#{name}`
    `git checkout --track -b #{name}  origin/#{name}`
    `rsync -avz --exclude="/.svn/" --exclude="/.git/" #{app_dir}/ .`
    `git add .`
    `git commit -a -n -m "initial app commit"`
    `git push`
    
    # switch to master and cleanup
    cleanup_git
    
    # database
    `git push origin origin:refs/heads/#{name}-db`
    `git checkout --track -b #{name}-db  origin/#{name}-db`
    `cp #{db_dump} .`
    `git add .`
    `git commit -a -n -m "initial db add"`
    `git push`
    
    # cleanup one last time
    cleanup_git
  end
  
  def cleanup_git
    # change to master
    `git checkout master`
    # cleanup git
    `git clean -d -f`
  end
  
end