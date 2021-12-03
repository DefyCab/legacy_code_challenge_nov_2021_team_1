# frozen_string_literal: true

RSpec.describe Api::AnalysesController, type: :request do
  describe 'Text analysis' do
    before do
      post '/api/analyses', params: {
        analysis: { resource: 'This is awesome',
                    category: :text }
      }
    end
    it 'responds with an text analysis' do
      expect(response.status).to eq 200
    end
    it 'is expected to return the requested resource' do
      expect(response_json['resource']).to eq 'This is awesome'
    end
    it 'is expected to show status clean' do
      expect(eval_json[0]['tag_name']).to eq 'clean'
    end
    it 'is expected to show confidence in the analysis' do
      expect(eval_json[0]['confidence']).to eq 0.844
    end
    it 'is expected to show the tag_id' do
      expect(eval_json[0]['tag_id']).to eq 57_725_628
    end
  end
end
