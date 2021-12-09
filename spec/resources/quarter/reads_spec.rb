require 'rails_helper'

RSpec.describe QuarterResource, type: :resource do
  describe 'serialization' do
    let!(:quarter) { create(:quarter) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(quarter.id)
      expect(data.jsonapi_type).to eq('quarters')
    end
  end

  describe 'filtering' do
    let!(:quarter1) { create(:quarter) }
    let!(:quarter2) { create(:quarter) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: quarter2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([quarter2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:quarter1) { create(:quarter) }
      let!(:quarter2) { create(:quarter) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            quarter1.id,
            quarter2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            quarter2.id,
            quarter1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
