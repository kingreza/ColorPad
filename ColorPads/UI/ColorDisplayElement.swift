//
//  ColorDisplayElement.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import BlueprintUI
import BlueprintUICommonControls

struct ColorDisplayElement: ProxyElement {

  var color: UIColor

  var elementRepresentation: Element {
    return Box(backgroundColor: color)
  }
}
