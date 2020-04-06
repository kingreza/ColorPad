//  
//  ColorPadDisplayWorkflow.swift
//  ColorPads
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import Workflow
import WorkflowUI
import ReactiveSwift


// MARK: Input and Output

struct ColorPadDisplayWorkflow: Workflow {
  
  var color: Property<UIColor>
  
  init(color: Property<UIColor>) {
    self.color = color
  }
  
  enum Output {
    
  }
}


// MARK: State and Initialization

extension ColorPadDisplayWorkflow {
  
  struct State {
    
  }
  
  func makeInitialState() -> ColorPadDisplayWorkflow.State {
    return State()
  }
  
  func workflowDidChange(from previousWorkflow: ColorPadDisplayWorkflow, state: inout State) {
    
  }
}


// MARK: Actions

extension ColorPadDisplayWorkflow {
  
  enum Action: WorkflowAction {
    
    typealias WorkflowType = ColorPadDisplayWorkflow
    
    func apply(toState state: inout ColorPadDisplayWorkflow.State) -> ColorPadDisplayWorkflow.Output? {
      
      switch self {
        // Update state and produce an optional output based on which action was received.
      }
      
    }
  }
}


// MARK: Workers

extension ColorPadDisplayWorkflow {
  
  struct ColorPadDisplayWorker: Worker {
    
    enum Output {
      
    }
    
    func run() -> SignalProducer<Output, Never> {
      fatalError()
    }
    
    func isEquivalent(to otherWorker: ColorPadDisplayWorker) -> Bool {
      return true
    }
    
  }
  
}

// MARK: Rendering

extension ColorPadDisplayWorkflow {
  
  typealias Rendering = ColorDisplayElement
  func render(state: ColorPadDisplayWorkflow.State, context: RenderContext<ColorPadDisplayWorkflow>) -> Rendering {
    return ColorDisplayElement(color: self.color.value)
  }
}
