require 'apktools/apkxml'

module FastlaneCore
  class ApkFileAnalyser
    # Fetches the package name (e.g. com.twitter.android) from the given apk file.
    def self.fetch_package_name(path)
      manifest = self.fetch_manifest_file(path)
      puts manifest
      return manifest['package'] if manifest
      return nil
    end

    def self.fetch_manifest_file(path)
      xml = ApkXml.new(path)
      xml.parse_xml("AndroidManifest.xml", true, true)
    end
  end
end
