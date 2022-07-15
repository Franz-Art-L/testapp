require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe 'POST /posts' do
        it 'create a new post object' do
           
        end

        it 'responds with a post object' do
            post :create, params: {title: 'Testing Title'}

            expected_response = {
                post: {
                    title: 'Testing Title'
                }
            }

            expect(response.body).to eq(expected_response.to_json)
        end
    end
end
