class NumberController < ApplicationController

  def index
      @no = params[:no]
      @noi=@no.to_i
      @nos=@no.to_s

      if @noi.negative?
        flash.now[:error] = "Girilen sayı pozitif olmalı"
      end

      array = @nos.to_s.split('').map(&:to_i)
      array = array.map(&:to_i)

      if array.length < 4 && @no.nil? == false
        flash.now[:error] = "Numarayı tam giriniz."

      elsif array.length > 4
        flash.now[:error] = "Fazla rakamı siliniz."
      end

      hesapla(array)

  end

  def hesapla(array)

    sozluk = [1071, 1453, 1881, 1903, 1905, 1907, 1920, 1923]
    sayi=array.inject{|n, d| n * 10 + d}
    sayiyaz=array.join('')

    if array.length < 4 || array.length > 4
      flash.now[:notice] = ""
    elsif array[0] == array [1] && array[0] == array [2] && array[0] == array[3]
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺1000 + KDV"
    elsif array[1] == array [2] && array[2] == array[3]
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺500 + KDV"
    elsif array[0] == array [2] && array[1] == array[3]
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺500 + KDV"
    elsif array[0] == array [1] && array[2] == array[3]
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺250 + KDV"
    elsif array[1] == 0 && array[3] == 0
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numrası özel bir numaradır. Fiyatı: ₺100 + KDV"
    elsif array[0] + array [3] == array[1] + array[2] && array[0] < array [1] && array[1] < array [2] && array[2] < array[3]
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺100 + KDV"
    elsif sozluk.include?(sayi)
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası özel bir numaradır. Fiyatı: ₺50 + KDV"
    else
      flash.now[:notice] = "+90 850 885 #{sayiyaz} numarası normal bir numaradır."
    end
  end

end
