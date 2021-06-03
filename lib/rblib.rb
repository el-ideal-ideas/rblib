# frozen_string_literal: true

require_relative "RbLib/version"

# Ruby用のユーティリティを纏めたモジュール
module RbLib
  # instance が type の一種であれば、instanceのそのまま返す、
  # それ以外の場合は ArgumentError の例外を返す。
  # nil_able 引数が真であれば、instance が nil の場合でもそのまま返す。
  def self.check_type(type, instance, nil_able = false)
    if instance.nil? and !nil_able
      raise ArgumentError::new("non-nil constraint violation")
    else
      unless instance.kind_of?(type)
        raise ArgumentError::new("type error: expected #{type} but got #{instance.class}")
      end
    end
    instance
  end
end
