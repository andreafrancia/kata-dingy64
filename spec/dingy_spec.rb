require 'dingy'
describe 'how to calculate remaining time' do
  it { expect(remaining_time "9:00", "9:25").to eq(25*60) }
  it { expect(remaining_time "9:25", "9:25").to eq(0*60) }
end
describe 'how to format remaining_time' do
  it do
    expect(format_time 0).to eq('00:00')
    expect(format_time 1).to eq('00:01')
    expect(format_time 10).to eq('00:10')
    expect(format_time 2*60 + 10).to eq('02:10')
    expect(format_time 99*60 + 59).to eq('99:59')
  end
end
#  $NOW 9:01          -->
#                         bin/dingy  -ok-> stdout '23:59'
#  next_alarm.txt 9:25 -->
describe 'how to launch executable' do
  let(:env) { {} }
  example do
    require 'open3'
    env['NOW'] = "9:00"
    File.write('next_alarm.txt', "9:25")
    out, _ = Open3.capture2(env, "bin/dingy")
    expect(out.chomp).to eq("25:00")
  end
end
