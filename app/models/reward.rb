class Reward < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  def new_diploma (position, prize, reward_number)
    dnum = rand(100)
    image = MiniMagick::Image.open("./public/original_diplomas/#{reward_number}.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end

    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#383838'
      c.pointsize '102'
      c.draw "text 0,945 '#{prize}'"

      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '36'
      c.draw "text 8,1778 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2220 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end


  def diploma_number1(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/1.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end

    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#f37a1f'
      c.pointsize '102'
      c.draw "text 0,600 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -153,1650 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number2(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/2.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#ff1e4a'
      c.pointsize '102'
      c.draw "text 0,500 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text 60,1740 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number3(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/3.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#0096cc'
      c.pointsize '102'
      c.draw "text 0,580 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text 36,1740 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 30,2250 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number4(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/4.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#00bdc3'
      c.pointsize '102'
      c.draw "text 0,810 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text 39,1800 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number5(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/5.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fc3400'
      c.pointsize '102'
      c.draw "text 0,510 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -107,1650 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number6(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/6.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fc3400'
      c.pointsize '102'
      c.draw "text 0,510 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text 48,1550 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2250 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number7(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/7.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fe2048'
      c.pointsize '102'
      c.draw "text 0,530 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -20,1630 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.fill '#ffffff'
      c.draw "text -20,2270 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number8(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/8.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#2180c3'
      c.pointsize '142'
      c.draw "text 0,650 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -22,1620 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text -20,2265 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number9(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/9.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#d42465'
      c.pointsize '142'
      c.draw "text 0,780 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -20,1840 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2215 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end

  def diploma_number10(position, prize)
    dnum = rand(100)
  	image = MiniMagick::Image.open("./public/original_diplomas/10.jpg")
    subject = ""
    if self.contest_id == 1
      subject = "по математике"
    elsif self.contest_id == 2
      subject = "по русскому языку"
    elsif self.contest_id == 3
      subject = "по английскому языку"
    elsif self.contest_id == 4
      subject = "по окружающему миру"
    end

    margin_text = -80
    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
      margin_text = 0
    end
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#cf4368'
      c.pointsize '122'
      c.draw "text 0,470 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '50'
      if self.prize != 0
        c.draw "text 0,#{position+480+margin_text} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480+margin_text} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '50'
      c.draw "text 0,#{position+560+margin_text} '#{subject}'"
      c.pointsize '40'
      c.draw "text -278,1810 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.fill '#ffffff'
      c.pointsize '36'
      c.draw "text 0,2291 '№ J-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end
end
