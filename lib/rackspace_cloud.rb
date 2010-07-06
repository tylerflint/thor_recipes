module RackspaceCloud
  
  def start_cloud_instance(name)
    
  end
  
  def get_cloud
    CloudServers::Connection.new(:username => 'tylerflint', :api_key => "4ea6f614df6acdac1f6333b03ae83d98")
  end

end