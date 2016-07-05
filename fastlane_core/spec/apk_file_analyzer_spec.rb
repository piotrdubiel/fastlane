describe FastlaneCore do
  describe FastlaneCore::ApkFileAnalyser do
    let(:apk) { 'Sample' }
    let(:path) { File.expand_path("../fixtures/apks/#{apk}.apk", __FILE__) }
    describe '::fetch_app_identifier' do
      subject { described_class.fetch_package_name(path) }
      it { is_expected.to eq 'com.example.Sample' }
      context 'when contains embedded app bundle' do
        let('ipa') { 'ContainsWatchApp' }
        it { is_expected.to eq 'com.example.Sample' }
      end
    end
  end
end
