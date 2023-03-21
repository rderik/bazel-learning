package calculator

import "testing"

func TestAdd(t *testing.T){
  expected := 5
  actual := Add(2,3)
  if actual != expected {
    t.Errorf("expected %q but got %q", expected, actual)
  }
}
