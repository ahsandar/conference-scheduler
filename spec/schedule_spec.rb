require_relative 'spec_helper'

describe Schedule do

  before(:all) do
    @app = App.new('talks-1.json')
    @app.run
  end

  context 'conference has KEYNOTE' do
    it 'should have a keynote at 09:00' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('KEYNOTE')
        expect(v['KEYNOTE']).not_to eql(nil)
        expect(v['KEYNOTE']).to start_with("09:00")
      end
    end
  end

  context 'conference has CLOSING' do
    it 'should have a closing at 17:00' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('CLOSING')
        expect(v['CLOSING']).not_to eql(nil)
        expect(v['CLOSING']).to start_with("17:00")
      end
    end
  end

  context 'conference has LUNCH' do
    it 'should have a keynote at 12:00' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('LUNCH')
        expect(v['LUNCH']).not_to eql(nil)
        expect(v['LUNCH']).to start_with("12:30")
      end
    end
  end

  context 'conference has TEA' do
    it 'should have a keynote at 09:00' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('TEA')
        expect(v['TEA']).not_to eql(nil)
        expect(v['TEA']).to start_with("15:00")
      end
    end
  end

  context 'conference has Track' do
    it 'should have a a track' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('Track')
        expect(v['Track']).not_to eql(nil)
      end
    end
  end

  context 'conference has SESSIONS' do
    it 'should have a session with talks' do
      @app.conference_schedule.daily_schedule['Day'].each_pair do |k,v|
        v.has_key?('Track')
        expect(v['Track']).not_to eql(nil)
        v['Track'].each_pair do |k1,v1|
          v.has_key?('Session')
        end
      end
    end
  end



end
