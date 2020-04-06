//
//  SplitContainerElement.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import BlueprintUI
import BlueprintUICommonControls

struct SplitContainerElement: ProxyElement {
  var topElement: Element?
  var bottomElement: Element?
  
  var elementRepresentation: Element {
    return Box(
      backgroundColor: .red,
      cornerStyle: .square,
      wrapping:Column { column in
        column.horizontalAlignment = .fill
        column.verticalUnderflow = .growUniformly
        column.add(
          child: Box(
            backgroundColor: .blue,
            wrapping: topElement
          )
        )
        column.add(
          child: Box(
            backgroundColor: .yellow,
            wrapping: bottomElement
          )
        )
      }
    )
  }
}
