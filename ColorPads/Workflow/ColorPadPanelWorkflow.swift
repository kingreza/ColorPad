//  
//  ColorPadPanelWorkflow.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import Workflow
import WorkflowUI
import ReactiveSwift


// MARK: Input and Output

struct ColorPadPanelWorkflow: Workflow {
  
  enum Output {
    case colorChanged(UIColor)
  }
}


// MARK: State and Initialization

extension ColorPadPanelWorkflow {
  
  struct State {
    
  }
  
  func makeInitialState() -> ColorPadPanelWorkflow.State {
    return State()
  }
  
  func workflowDidChange(from previousWorkflow: ColorPadPanelWorkflow, state: inout State) {
    
  }
}


// MARK: Actions

extension ColorPadPanelWorkflow {
  
  enum Action: WorkflowAction {
    
    case colorChanged(UIColor)
    typealias WorkflowType = ColorPadPanelWorkflow
    
    func apply(toState state: inout ColorPadPanelWorkflow.State) -> ColorPadPanelWorkflow.Output? {
      
      switch self {
        // Update state and produce an optional output based on which action was received.
      case .colorChanged(let color):
        return .colorChanged(color)
      }
    }
  }
}


// MARK: Workers

extension ColorPadPanelWorkflow {
  
  struct ColorPadPanelWorker: Worker {
    
    enum Output {
      
    }
    
    func run() -> SignalProducer<Output, Never> {
      fatalError()
    }
    
    func isEquivalent(to otherWorker: ColorPadPanelWorker) -> Bool {
      return true
    }
    
  }
  
}

// MARK: Rendering

extension ColorPadPanelWorkflow {
  typealias Rendering = ColorPadPanelElement
  func render(state: ColorPadPanelWorkflow.State, context: RenderContext<ColorPadPanelWorkflow>) -> Rendering {
    let sink = context.makeSink(of: Action.self)
    
    return ColorPadPanelElement(
      colors: [
        .red,
        .blue,
        .brown,
        .green,
        .magenta,
        .orange,
      ], onColorChanged: {color in
        sink.send(
          .colorChanged(color)
        )
      }
    )
  }
}
