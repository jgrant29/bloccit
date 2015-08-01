require 'rails_helper'

  describe Vote  do
      describe "validations" do
        describe "valuen validation" do
          it "only allows -1 or 1 as values" do
            expect( @post.vote ).to eq(1)
            expect( @post.vote ).to eq (-1)
          end
        end
      end
    end