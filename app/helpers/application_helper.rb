module ApplicationHelper
  def report_header region, forestry, detour, quarter
      "<p class='text-center'>
        <strong>#{region}</strong>
      Meşə Mühafizəsi və Bərpası Müəssisəsinin
      <strong>#{forestry}</strong>nin <u>#{detour}</u> saylı meşə dolayınının
      <u>#{quarter}</u> saylı kvartalında 
      #{l Date.today, format: :long}
      tarixdə aparılmış _________ yoxlama zamanı aşkar edilmiş özbaşına qırıntıların
      </p>
      <h2 class='text-center'>HƏCM -QİYMƏT CƏDVƏLİ</h2>".html_safe
  end

end
