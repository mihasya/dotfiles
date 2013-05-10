package pkgmgr

import (
	. "launchpad.net/gocheck"
	"testing"
)

// boilerplate
func Test(t *testing.T) { TestingT(t) }
type MySuite struct{}
var _ = Suite(&MySuite{})

func (s *MySuite) TestFoo(c *C) {
}
