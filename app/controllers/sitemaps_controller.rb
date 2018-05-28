class SitemapsController < ApplicationController

def show
    # Redirect to CloudFront and S3
    redirect_to "http://s3.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz"
  end



end
