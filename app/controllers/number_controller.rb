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

  end


end
