package main
import (
  "log"
  "fmt"
  "net/http"
  "math/rand"

  "github.com/gin-gonic/gin"
  "github.com/rderik/bazel-learning/projects/go-libs/calculator"
)

func WebHandler(w http.ResponseWriter, r * http.Request) {
  log.Println("Received request")
  w.WriteHeader(http.StatusOK)
  fmt.Fprintf(w, "Random sum: %d\n", calculator.Add(rand.Intn(100), rand.Intn(100)))
}

func main() {
    r := gin.Default()
    r.GET("/", WebHandler) 
    r.Run("0.0.0.0:8080")
}
