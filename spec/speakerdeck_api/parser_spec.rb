module SpeakerdeckApi
  describe Parser do

    let(:speaker_profile_page) do
      path = File.join(File.dirname(File.expand_path(__FILE__)), "../fixtures/speaker_profile.html")
      f = File.open(path)
      doc = Nokogiri::XML(f)
      f.close
      doc
    end

    context 'speakers' do
      describe '.get_speaker_details' do
        context 'valid speaker' do

          it 'contains the "number of talks" key' do
            expect(subject.get_speaker_details(speaker_profile_page)).to have_key(:number_of_talks)
          end

          it 'contains the right value' do
            expect(subject.get_speaker_details(speaker_profile_page).values_at(:number_of_talks)).to eql([14])
          end
        end
      end
    end
  end
end
