//
//  ColorPadPanelElement.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import BlueprintUI
import BlueprintUICommonControls

struct ColorPadPanelElement: ProxyElement {
  let colors: [UIColor]
  let onColorChanged: (UIColor) -> Void
  
  var elementRepresentation: Element {
    guard colors.count <= 10 else {
      fatalError("Too many colors")
    }
    
    let itemsPerRow = colors.count / 2
    
    return Column { column in
      column.verticalUnderflow = .growUniformly
      column.horizontalAlignment = .fill
      column.add(
        child: Row { row in
          row.horizontalUnderflow = .growUniformly
          row.verticalAlignment = .fill
          for index in 0..<itemsPerRow {
            row.add(child:
              Tappable(
                onTap: {
                  self.onColorChanged(self.colors[index])
                },
                wrapping: Box(
                  backgroundColor:colors[index]
                )
              )
            )
          }
        }
      )
     
      column.add(
        child: Row { row in
          row.horizontalUnderflow = .growUniformly
          row.verticalAlignment = .fill
          for index in itemsPerRow..<colors.count {
            row.add(child:
              Tappable(
                onTap: {
                  self.onColorChanged(self.colors[index])
                },
                wrapping: Box(
                  backgroundColor:colors[index]
                )
              )
            )
          }
        }
      )
    }
  }

}
