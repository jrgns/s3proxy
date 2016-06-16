require 's3proxy/version'
require 'aws-sdk'
require 'digest'

module S3Proxy
  def proxy_s3_file(bucket, key)
    cached_file = cache_location(bucket, key)

    options = {
      bucket: bucket,
      key: key,
    }
    options[:if_modified_since] = File.mtime(cached_file) if File.exists?(cached_file)

    begin
      s3object = s3.get_object(options, target: cached_file)
    rescue Aws::S3::Errors::NotModified
      options.delete(:if_modified_since)
      s3object = s3.head_object(options)
    end
    File.new cached_file
  end

  private
  def cache_location(bucket, key)
    hash = Digest::MD5.hexdigest "#{bucket}/#{key}"
    path = "#{Dir.tmpdir}/s3proxy-#{Process.pid}"
    Dir.mkdir(path, 0700) unless File.exists?(path)
    "#{path}/#{hash}"
  end

  private
  def s3
    @s3 ||= Aws::S3::Client.new
  end
end
