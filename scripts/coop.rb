require 'nokogiri'
require 'active_support/inflector'

class Coop
  attr_reader :doc

  def initialize(fn)
    html = File.read(fn)
    @fn = fn
    @doc = Nokogiri::HTML(html)
  end

  def slug
    File.basename(@fn, '.html')
  end

  def name
    doc.xpath('//*[@id="page-banner"]/div/div/h2').text
  end

  alias title name

  def website
    doc.xpath('//*[@id="page-banner"]/div/div/a[2]').text.strip
  end

  def email
    doc.xpath('/html/body/div/div[2]/div/div/div[1]/section/div[2]/p/a').text.strip
  end

  def twitter
    url = doc.xpath('/html/body/div/div[2]/div/div/div[1]/section/div[1]/ul/li[2]/a/@href').text
    URI.parse(url).path.split('/').last
  end

  def github
    url = doc.xpath('/html/body/div/div[2]/div/div/div[1]/section/div[1]/ul/li[3]/a/@href').text
    URI.parse(url).path.split('/').last
  end

  def telephone
    doc.xpath('/html/body/div/div[2]/div/div/div[1]/section/div[3]/p').text
  end

  def address
    doc.xpath('/html/body/div/div[2]/div/div/div[1]/section/div[4]/p').text
  end

  def latitude
    script = doc.xpath('/html/body/div/section/script').text
    match = /var latitude = '(.+)';/.match(script)
    match[1] if match
  end

  def longitude
    script = doc.xpath('/html/body/div/section/script').text
    match = /var longitude = '(.+)';/.match(script)
    match[1] if match
  end

  def services
    doc.css('a.service-thumb').map do |node|
      url = node.xpath('@href').text
      url.split('/')[2]
    end
  end

  def clients
    doc.css('div.client-thumb-container').map do |node|
      style = node.xpath('div/@style')
      {
        title: node.xpath('h5').text,
        slug: node.xpath('h5').text&.parameterize,
        logo: style.text.match(/background-image: url\((.*)\)/)[1]
      }
    end
  end

  def technologies
    doc.css('a.technology-thumb').map do |node|
      url = node.xpath('@href').text
      url.split('/')[2]
    end
  end

  def body
    doc.xpath('/html/body/div/div[2]/div/div/div[2]/section[1]').text.strip
  end

  def logo
    doc.xpath('//*[@id="page-banner"]/div/div/a[1]/img/@src').text
  end

  def erb_binding
    binding
  end

  def self.all
    %w(
      agile-collective.html
      alpha-communication.html
      animorph.html
      aptivate.html
      autonomic.html
      blake-house-filmmakers-co-op.html
      calverts.html
      cbn.html
      cetis-llp.html
      chapel-street-studio.html
      co-operative-web.html
      creative-coop.html
      dev-the-developers-society.html
      digital-liberties.html
      dot-project.html
      dtc-innovation.html
      fairmondo-uk.html
      founders-and-coders.html
      gildedsplinters.html
      glowbox-design.html
      go-free-range.html
      graphics-coop.html
      mc3.html
      media-coop.html
      mediablaze-hosts.html
      netuxo.html
      open-data-services.html
      open-ecommerce.html
      outlandish.html
      secure-active-c-i-c.html
      small-axe.html
      tableflip.html
      wave.html
      we-are-open.html
      webarchitects.html
    ).map do |page|

      fn = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', 'co-op', page)
      new(fn)
    end
  end
end
