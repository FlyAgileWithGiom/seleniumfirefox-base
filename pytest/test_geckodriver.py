from seleniumbase import get_driver
driver = get_driver("firefox", headless=False)
driver.get("https://www.mozilla.org/firefox")
driver.quit()
exit()
