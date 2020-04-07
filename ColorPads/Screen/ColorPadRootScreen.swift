//  
//  ColorPadRootScreen.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import BlueprintUI
import BlueprintUICommonControls
import Workflow
import WorkflowUI


struct ColorPadRootScreen: Screen {
  // This should contain all data to display in the UI
  
  // It should also contain callbacks for any UI events, for example:
  // var onButtonTapped: () -> Void
  
  //var splitContainerElement: SplitContainerElement
  var topElement: Element?
  var bottomElement: Element?
  
  func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
    return ColorPadRootViewController.description(for: self, environment: environment)
  }
}


final class ColorPadRootViewController: ScreenViewController<ColorPadRootScreen> {
  
  private var blueprintView: BlueprintView!
  
  required init(screen: ColorPadRootScreen, environment: ViewEnvironment) {
    super.init(screen: screen, environment: environment)
    update(with: screen, environment: environment)
    self.blueprintView = generatedBlueprintView(with: screen)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = self.blueprintView
  }
  
  override func screenDidChange(from previousScreen: ColorPadRootScreen, previousEnvironment: ViewEnvironment) {
    update(with: screen, environment: environment)
  }
  
  private func generatedBlueprintView(with screen: ColorPadRootScreen) -> BlueprintView {
    return BlueprintView(element:
      SplitContainerElement(
        topElement: screen.topElement,
        bottomElement: screen.bottomElement
      )
    )
  }
  
  private func update(with screen: ColorPadRootScreen, environment: ViewEnvironment) {
    /// Update UI
    self.blueprintView = generatedBlueprintView(with: screen)
    //TODO: understand why I need to do this to trigger a redraw
    self.view = self.blueprintView
  }
}
