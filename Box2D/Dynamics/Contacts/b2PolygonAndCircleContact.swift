/**
Copyright (c) 2006-2014 Erin Catto http://www.box2d.org
Copyright (c) 2015 - Yohei Yoshihara

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
claim that you wrote the original software. If you use this software
in a product, an acknowledgment in the product documentation would be
appreciated but is not required.

2. Altered source versions must be plainly marked as such, and must not be
misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.

This version of box2d was developed by Yohei Yoshihara. It is based upon
the original C++ code written by Erin Catto.
*/

import Foundation

public class b2PolygonAndCircleContact : b2Contact {
  override class func create(fixtureA: b2Fixture, _ indexA: Int, _ fixtureB: b2Fixture, _ indexB: Int) -> b2Contact {
    return b2PolygonAndCircleContact(fixtureA, fixtureB)
  }
  override class func destroy(contact: b2Contact) {
  }
  
  init(_ fixtureA : b2Fixture, _ fixtureB : b2Fixture) {
    super.init(fixtureA, 0, fixtureB, 0)
    assert(m_fixtureA.type == b2ShapeType.polygon)
    assert(m_fixtureB.type == b2ShapeType.circle)
  }

  override public func evaluate(inout manifold: b2Manifold, _ xfA: b2Transform, _ xfB: b2Transform) {
    b2CollidePolygonAndCircle(manifold: &manifold,
      polygonA: m_fixtureA.shape as! b2PolygonShape, transformA: xfA,
      circleB: m_fixtureB.shape as! b2CircleShape, transformB: xfB)
  }
}