// Package main is the entry point for the family photo album API.
package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Family Photo Album API v1.0 is running!")
	})

	app.Listen(":8080") //nolint:errcheck
}
