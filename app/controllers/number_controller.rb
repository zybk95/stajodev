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
      #arrayın elemanlar int olacak

      if array.length < 4 && @no.nil? == false
        flash.now[:error] = "Numarayı tam giriniz #{array.length}"

      elsif array.length > 4
        flash.now[:error] = "Fazla rakamı siliniz #{array[0].class}"
      end

      hesapla(array)

  end

  def hesapla(array)

    sozluk = [1071, 1903, 1905]
    sayi=array.inject{|n, d| n * 10 + d}

    if array.length == 0
      flash.now[:notice] = ""
    elsif array[0] == array [1] && array[0] == array [2] && array[0] == array[3]
      flash.now[:notice] = "1. Şart"
    elsif array[1] == array [2] && array[2] == array[3]
      flash.now[:notice] = "2. Şart"
    elsif array[0] == array [2] && array[1] == array[3]
      flash.now[:notice] = "2. Şart"
    elsif array[0] == array [1] && array[2] == array[3]
      flash.now[:notice] = "3. Şart"
    elsif array[1] == 0 && array[3] == 0
      flash.now[:notice] = "4. Şart"
    elsif array[0] + array [3] == array[1] + array[2]
      flash.now[:notice] = "4. Şart"
    elsif sozluk.include?(sayi)
      flash.now[:notice] = "5. Şart"
    end
  end
end
