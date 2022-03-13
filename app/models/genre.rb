class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'FREE STYLE' },
    { id: 3, name: 'BREAKING' },
    { id: 4, name: 'POPING' },
    { id: 5, name: 'LOCKING' },
    { id: 6, name: 'WAACKING' },
    { id: 7, name: 'HIP HOP' },
    { id: 8, name: 'HOUSE' },
    { id: 9, name: 'KRUMP' },
    { id: 10, name: 'REGGAE' },
    { id: 11, name: 'JAZZ' },
    { id: 12, name: 'SOUL' }
  ]

  include ActiveHash::Associations
  has_many :profiles
end