//  
//  ColoPadRootWorkflow.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import Workflow
import WorkflowUI
import ReactiveSwift


// MARK: Input and Output

struct ColorPadRootWorkflow: Workflow {
    
  init() {
  }
  
  enum Output {
    
  }
}


// MARK: State and Initialization

extension ColorPadRootWorkflow {
  
  struct State {
    var color: UIColor
  }
  
  func makeInitialState() -> ColorPadRootWorkflow.State {
    return State(color: .brown)
  }
  
  func workflowDidChange(from previousWorkflow: ColorPadRootWorkflow, state: inout State) {
  }
}


// MARK: Actions

extension ColorPadRootWorkflow {
  
  enum Action: WorkflowAction {
    
    case colorChanged(UIColor)
    
    typealias WorkflowType = ColorPadRootWorkflow
    
    func apply(toState state: inout ColorPadRootWorkflow.State) -> ColorPadRootWorkflow.Output? {
      switch self {
       case .colorChanged(let color):
        state.color = color
      }
      return nil
    }
  }
}


// MARK: Rendering

extension ColorPadRootWorkflow {
  
  typealias Rendering = ColorPadRootScreen
  
  func render(state: ColorPadRootWorkflow.State, context: RenderContext<ColorPadRootWorkflow>) -> Rendering {
    
    let topElement = ColorPadDisplayWorkflow(
      color: state.color
    ).mapOutput({(action) -> Action in}).mapRendering({$0}).rendered(with: context)
    
    let bottomElement = ColorPadPanelWorkflow()
      .mapOutput({(output) -> Action in
        switch output {
        case .colorChanged(let newColor):
          return .colorChanged(newColor)
        }
      }
    ).rendered(with: context)
    
    return ColorPadRootScreen(
      topElement: topElement,
      bottomElement: bottomElement)
  }
}
