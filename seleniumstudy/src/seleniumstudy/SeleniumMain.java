package seleniumstudy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumMain {
	private WebDriver driver;
	private WebElement webElement;
	public SeleniumMain() {
		System.setProperty("webdriver.chrome.driver",
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
			webElement.sendKeys("123");
			webElement = driver.findElement(By.name("f"));
			webElement.submit();
			Thread.sleep(3000);
			/*
			 * By.xpath : DOM트리에서 노드 찾아가는 방법 설정.
			 * 	/: 문서노드. 루트노드
			 * 	html : 루트태그, 루트엘리먼트
			 * 	/ : 자식노드.
			 * 	//: 자손노드.
			 * */
			//회원목록보기 영역의미
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
