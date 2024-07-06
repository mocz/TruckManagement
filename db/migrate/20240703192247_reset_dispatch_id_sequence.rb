class ResetDispatchIdSequence < ActiveRecord::Migration[7.1]
  def up
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE dispatches_id_seq RESTART WITH 1000")
  end
end
