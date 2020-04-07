//
//  ColorPadsTests.swift
//  ColorPadsTests
//
//  Created by Reza Shirazian on 4/6/20.
//  Copyright © 2020 Reza Shirazian. All rights reserved.
//

import XCTest
import WorkflowTesting

@testable import ColorPads

class ColorPadsTests: XCTestCase {
  
  func test_colorPadPanelWorkflow_colorChange() throws {
    ColorPadPanelWorkflow.Action
      .tester(withState: ColorPadPanelWorkflow.State())
      .send(action: .colorChanged(.red)) { output in
        switch output {
        case .colorChanged(let color):
          XCTAssertEqual(color, .red)
        default:
          XCTFail()
        }
    }
  }
  
  func test_colorPadRootWorkflow_colorChange() {
    ColorPadRootWorkflow.Action
      .tester(withState: ColorPadRootWorkflow.State(color: .blue))
      .assertState {state in
        XCTAssertEqual(state.color, .blue)
      }.send(action: .colorChanged(.red))
      .assertState {state in
        XCTAssertEqual(state.color, .red)
      }
  }
}
