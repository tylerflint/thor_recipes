require 'rackspace_cloud'

class Rackspace < Thor
  
  include RackspaceCloud
  
  desc "list-clouds", "list all of our cloud instances"
  def list_clouds
    # cloud handle
    cloud = get_cloud
    cloud.servers.each do |server|
      puts server[:name]
    end
  end
  
  desc "list-images", "list all of our available cloud images"
  def list_images
    cloud = get_cloud
    cloud.list_images.each do |image|
      puts image[:name]
    end
  end
  
end