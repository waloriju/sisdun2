module CustomersHelper

  def validar_cpf(cpf)
    cpf = cpf.gsub(/[^0-9]/,"").scan(/./).map(&:to_i)
    dv = cpf.last(2)
    r1 = 10.downto(1).zip(cpf).map{|x,y| x*y}.sum % 11
    r2 = 10.downto(1).zip(cpf.drop(1)).map{|x,y| x*y}.sum % 11
    r1 == (dv[0] == 0 ? 1 : 0) && r2 == (dv[1] == 0 ? 1 : 0)
  end

end
