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
  
  var color: Property<UIColor>
  
  init() {
    self.color = Property(value: .brown)
  }
  enum Output {
    
  }
}


// MARK: State and Initialization

extension ColorPadRootWorkflow {
  
  struct State {
    
  }
  
  func makeInitialState() -> ColorPadRootWorkflow.State {
    return State()
  }
  
  func workflowDidChange(from previousWorkflow: ColorPadRootWorkflow, state: inout State) {
    
  }
}


// MARK: Actions

extension ColorPadRootWorkflow {
  
  enum Action: WorkflowAction {
    
    typealias WorkflowType = ColorPadRootWorkflow
    
    func apply(toState state: inout ColorPadRootWorkflow.State) -> ColorPadRootWorkflow.Output? {
      
      switch self {
        // Update state and produce an optional output based on which action was received.
      }
      
    }
  }
}


// MARK: Workers

extension ColorPadRootWorkflow {
  
  struct ColoPadRootWorker: Worker {
    
    enum Output {
      
    }
    
    func run() -> SignalProducer<Output, Never> {
      fatalError()
    }
    
    func isEquivalent(to otherWorker: ColoPadRootWorker) -> Bool {
      return true
    }
    
  }
  
}

// MARK: Rendering

extension ColorPadRootWorkflow {
  
  typealias Rendering = ColorPadRootScreen
  
  func render(state: ColorPadRootWorkflow.State, context: RenderContext<ColorPadRootWorkflow>) -> Rendering {
    
    let topElement = ColorPadDisplayWorkflow(
      color: self.color
    ).mapOutput({(action) -> Action in}).mapRendering({$0}).rendered(with: context)
    
    let bottomElement = ColorPadPanelWorkflow().mapOutput({(action) -> Action in}).rendered(with: context)
    
    return ColorPadRootScreen(
      topElement: topElement,
      bottomElement: bottomElement)
  }
}
