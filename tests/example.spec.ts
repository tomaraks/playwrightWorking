import { test, expect, request } from "@playwright/test";

test("has title", async ({ page }) => {
  await page.goto("https://playwright.dev/");

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Playwright/);
});

test("get started link", async ({ page }) => {
  await page.goto("https://playwright.dev/");

  // Click the get started link.
  await page.getByRole("link", { name: "Get started" }).click();

  // Expects page to have a heading with the name of Installation.
  await expect(
    page.getByRole("heading", { name: "Installation" })
  ).toBeVisible();
});

test("run an api test", async ({ page, request }) => {
  let response = await request.get(
    "https://jsonplaceholder.typicode.com/todos/1"
  );

  let responseBody = await response.json();
  expect(responseBody).toHaveProperty("completed");
});
