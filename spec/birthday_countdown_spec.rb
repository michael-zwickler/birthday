RSpec.describe BirthdayCountdown do

  describe '#days_to_birthday' do
    context 'when the birthday is today' do
      it 'returns 0' do
        t = Time.now
        day = t.day
        month = t.month
        expect(subject.days_to_birthday(day, month)).to eq(0)
      end
    end
    context 'when the birthday is tomorrow' do
      it 'returns 1' do
        t = Time.now
        day = t.day + 1
        month = t.month
        expect(subject.days_to_birthday(day, month)).to eq(1)
      end
    end
    context 'when the birthday was yesterday' do
      it 'return 364 or 365' do
        t = Time.now
        day = t.day - 1
        month = t.month
        expect([364, 365]).to include(subject.days_to_birthday(day,month))
      end
    end
  end

end