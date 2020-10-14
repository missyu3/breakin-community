class DanceLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '【ダンス歴未設定】' },
    { id: 2, name: '【ダンスは見る方が好き】' },
    { id: 3, name: '【ダンス歴 0 ~ 2年(初心者レベル)】' },
    { id: 4, name: '【ダンス歴 2 ~ 5年(中級者レベル)】' },
    { id: 5, name: '【ダンス歴 5 ~ 10年(上級者レベル)】' },
    { id: 6, name: '【ダンス歴 10年 ~ (指導者・プロレベル)】' }
  ]
end
