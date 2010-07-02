class ContractsController < BaseController
  def new
    #新建默认数量的项目
    @contract = Contract.new
    5.times {@contract.fixed_subsidies.build}
    5.times {@contract.fixed_deductions.build}
    5.times {@contract.unfixed_subsidies.build}
    5.times {@contract.unfixed_deductions.build}
    10.times {@contract.other_deductions.build}
  end
end
