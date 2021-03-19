package seleniumstudy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SeleniumMain {
	private WebDriver driver;
	private WebElement webElement;
	public SeleniumMain() {
		System.setProperties("webdriver.chrome.driver",
				"C:/Users/sa365/Downloads/chromedriver_win32/chromedriver.exe");
		driver = new ChromeDriver();
	}
	public static void main(String[] args) {
		SeleniumMain main = new SeleniumMain();
		main.crawl();
	}
	private void crawl() {
		try {
			driver.get
			("http://localhost:8080/jspstudy2/model2/member/loginForm.me");
			webElement = driver.findElement(By.name("id"));
			webElement.sendKeys("admin");
			webElement = driver.findElement(By.name("pass"));
			webElement.sendKeys("1234");
			webElement = driver.findElement(By.name("f"));
			webElement.submit();
			Thread.sleep(3000);
			webElement = driver.findElement
						(By.xpath("/html/body//a[@href='list.me']"));
			webElement.click();
			Thread.sleep(3000);
			driver.get
			("http://localhost:8080/jspstudy2/model2/member/list.me");
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements table = doc.select(".w3-container.w3-col > table");
			for(Element e : table) {
				for(Element tr : e.select("tr")) {
					Elements tds = tr.select("td");
					if(tds.size() > 3) {
						System.out.println(tds.get(2).html());
					}
				}
			}
			Thread.sleep(5000);
		}catch(Exception e) {e.printStackTrace();}
		finally {driver.close();}
	}

}
