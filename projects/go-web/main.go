package go_web
import (
  "log"
  "fmt"
  "net/http"
  "math/rand"

  "github.com/gorilla/mux"
  "github.com/rderik/bazel-learning/projects/go-libs/calculator"
)

func WebHandler(w http.ResponseWriter, r * http.Request) {
  log.Println("Received request")
  w.WriteHeader(http.StatusOK)
  fmt.Fprintf(w, "Random sum: %d\n", calculator.Add(rand.Intn(100), rand.Intn(100)))
}

func main() {
    r := mux.NewRouter()
    r.HandleFunc("/", WebHandler) 
    http.Handle("/", r)
}
