# encoding: utf-8
require File.dirname(__FILE__) + '/../../spec_helper'

module SendGrid4r::REST::Stats
  describe Advanced do
    describe 'integration test', :it do
      before do
        Dotenv.load
        @client = SendGrid4r::Client.new(api_key: ENV['SILVER_API_KEY'])
      end

      context 'without block call' do
        it '#get_geo_stats with mandatory params' do
          top_stats = @client.get_geo_stats(start_date: '2015-01-01')
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.metrics.clicks.nil?).to be(false)
              expect(stat.metrics.opens.nil?).to be(false)
              expect(stat.metrics.unique_clicks.nil?).to be(false)
              expect(stat.metrics.unique_opens.nil?).to be(false)
              expect(stat.name).to be_a(String)
              expect(stat.type).to eq('country')
            end
          end
        end

        it '#get_geo_stats with all params' do
          top_stats = @client.get_geo_stats(
            start_date: '2015-01-01',
            end_date: '2015-01-02',
            aggregated_by: :week,
            country: :US
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end

        it '#get_devices_stats with mandatory params' do
          top_stats = @client.get_devices_stats(start_date: '2015-01-01')
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.name).to be_a(String)
              expect(stat.type).to eq('device')
            end
          end
        end

        it '#get_devices_stats with all params' do
          top_stats = @client.get_devices_stats(
            start_date: '2015-01-01',
            end_date: '2015-01-02',
            aggregated_by: :week
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end

        it '#get_clients_stats with mandatory params' do
          top_stats = @client.get_clients_stats(start_date: '2015-01-01')
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.name).to be_a(String)
              expect(stat.type).to eq('client')
            end
          end
        end

        it '#get_clients_stats with all params' do
          top_stats = @client.get_clients_stats(
            start_date: '2015-01-01',
            end_date: '2015-01-02',
            aggregated_by: :week
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end

        it '#get_clients_type_stats with mandatory params' do
          top_stats = @client.get_clients_type_stats(
            start_date: '2015-01-01', client_type: 'webmail'
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.name).to be_a(String)
              expect(stat.type).to eq('client')
            end
          end
        end

        it '#get_clients_stats with all params' do
          top_stats = @client.get_clients_type_stats(
            start_date: '2015-01-01',
            end_date: '2015-01-02',
            aggregated_by: :week,
            client_type: :webmail
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end

        it '#get_mailbox_providers_stats with mandatory params' do
          top_stats =
            @client.get_mailbox_providers_stats(start_date: '2015-01-23')
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.metrics.blocks.nil?).to be(false)
              expect(stat.metrics.bounces.nil?).to be(false)
              expect(stat.metrics.clicks.nil?).to be(false)
              expect(stat.metrics.deferred.nil?).to be(false)
              expect(stat.metrics.delivered.nil?).to be(false)
              expect(stat.metrics.drops.nil?).to be(false)
              expect(stat.metrics.opens.nil?).to be(false)
              expect(stat.metrics.spam_reports.nil?).to be(false)
              expect(stat.metrics.unique_clicks.nil?).to be(false)
              expect(stat.metrics.unique_opens.nil?).to be(false)
              expect(stat.name).to eq(nil)
              expect(stat.type).to eq('mailbox_provider')
            end
          end
        end

        it '#get_mailbox_providers_stats with all params' do
          top_stats = @client.get_mailbox_providers_stats(
            start_date: '2015-01-01',
            end_date: '2015-01-31',
            aggregated_by: :week,
            mailbox_providers: :Other
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end

        it '#get_browsers_stats with mandatory params' do
          top_stats = @client.get_browsers_stats(start_date: '2015-01-01')
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
              expect(stat.name).to eq(nil)
              expect(stat.type).to eq('browser')
            end
          end
        end

        it '#get_browsers_stats with all params' do
          top_stats = @client.get_browsers_stats(
            start_date: '2015-01-01',
            end_date: '2015-09-02',
            aggregated_by: :week,
            browsers: :chrome
          )
          expect(top_stats).to be_a(Array)
          top_stats.each do |top_stat|
            expect(top_stat).to be_a(TopStat)
            expect(top_stat.date).to be_a(String)
            expect(top_stat.stats).to be_a(Array)
            top_stat.stats.each do |stat|
              expect(stat).to be_a(Stat)
              expect(stat.metrics).to be_a(Metric)
            end
          end
        end
      end
    end
  end
end
