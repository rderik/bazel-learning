package main
import (
  "log"
  "fmt"
  "math/rand"

  "github.com/gin-gonic/gin"
  "github.com/rderik/bazel-learning/projects/go-libs/calculator"
)

func WebHandler(c *gin.Context) {
  log.Println("Received request")
  c.Data(200, "application/json; charset=utf-8", []byte( fmt.Sprintf("Random sum: %d\n", calculator.Add(rand.Intn(100), rand.Intn(100)))))
}

func main() {
    r := gin.Default()
    r.GET("/", WebHandler) 
    r.Run("0.0.0.0:8080")
}
