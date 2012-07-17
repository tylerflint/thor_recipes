module RackspaceCloud
  
  def start_cloud_instance(name)
    
  end
  
  def get_cloud
    CloudServers::Connection.new(:username => 'tylerflint', :api_key => "xxx")
  end

end