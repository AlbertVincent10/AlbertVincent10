//
//  ViewController.swift
//  AVLCharts
//
//  Created by albert Michael on 13/09/22.
//

import UIKit
//import SwiftCharts
import Charts
import CoreGraphics



class ViewController: UIViewController,ChartViewDelegate {
    var entries = [ChartDataEntry]()
    let lineChart = LineChartView()
    var newEntry = ChartDataEntry.self
    var i = 0.0
    var movedata  = [ChartDataEntry]()
    var chartarray1 = [-182,103,215,513,759,563,346,646,1115,1262,1347,1780,2269,2277,2050,2132,2225,1828,1367,1518,2053,2326,2375,2653,3031,3137,3280,3853,4494,4726,4753,4940,5002,4608,4250,4402,4544,4003,3036,2269,1675,944,311,81,-102,-636,-1217,-1479,-1643,-1960,-2173,-2067,-2067,-2474,-2718,-2315,-1780,-1731,-1898,-1732,-1379,-1257,-1194,-863,-590,-756,-1040,-1070,-1056,-1198,-1214,-978,-1017,-1606,-2052,-1808,-1379,-1381,-1571,-1481,-1307,-1438,-1657,-1621,-1654,-2115,-2586,-2590,-2383,-2329,-2223,-1901,-1863,-2395,-2776,-2378,-1645,-1209,-916,-376,154,191,-86,-238,-468,-1086,-1647,-1659,-1452,-1518,-1685,-1703,-2030,-2956,-3665,-3427,-2736,-2350,-2163,-1767,-1354,-1196,-741,759,3142,5663,7665,8227,6278,1839,-3389,-7309,-9151,-9208,-7649,-4904,-2257,-792,-324,-101,-1,-241,-474,-259,46,-87,-352,-200,183,342,403,692,918,749,713,1345,2146,2394,2265,2351,2612,2694,2799,3263,3774,3913,3930,4190,4501,4606,4721,5011,5022,4431,3828,3770,3801,3293,2492,1966,1626,1071,442,44,-404,-1219,-2041,-2480,-2742,-3050,-3143,-2869,-2740,-3107,-3384,-3037,-2502,-2362,-2412,-2233]
   var xValue: Double = 0
    let LinePath = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    var fromValue = CGPoint()
    var toValue = CGPoint()
    
    let Yvalue:[ChartDataEntry] = [
        ChartDataEntry(x:0.1, y:10.0),
        ChartDataEntry(x:0.6, y:4.0),
        ChartDataEntry(x:0.7, y:3.0),
        ChartDataEntry(x:0.5, y:0.5),
        ChartDataEntry(x:0.9, y:0.1),
        ChartDataEntry(x:0.6, y:9.0),
        ChartDataEntry(x:0.3, y:8.0),
        ChartDataEntry(x:0.2, y:9.5),
        ChartDataEntry(x:0.4, y:0.3),
        ChartDataEntry(x:0.5, y:10.0),

    ]

   
    
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
//        self.draw(CGRect(x: 0, y: 0,width: 50,height: 50))
//        self.quadCurvedPath()
//        let viewRect = CGRect(x: 0, y: 0, width: 100, height: 10)
//        let myEmptyView = viewRect(frame: viewRect)
//
      
       
    }

func graphPlot() {
    
    
    
    
       lazy var lineChartView: LineChartView = {
           let lineChart = LineChartView()
           lineChart.backgroundColor = .white
           lineChart.rightAxis.enabled = false
           lineChart.dragEnabled = true
         
           let yAxis = lineChart.leftAxis
           yAxis.labelFont = .boldSystemFont(ofSize: 12)
           yAxis.setLabelCount(6, force: false)
           yAxis.labelTextColor = .black
           yAxis.axisLineColor = .black
           yAxis.labelPosition = .insideChart
           
           
          
           let xAxis = lineChart.rightAxis
           xAxis.labelFont = .boldSystemFont(ofSize: 12)
           xAxis.setLabelCount(6, force: false)
           xAxis.axisLineColor = .white
           lineChart.xAxis.labelPosition = .bottom
           xAxis.labelTextColor = .white
          
           lineChart.animate(xAxisDuration: 3.0)
           
           lineChart.xAxis.avoidFirstLastClippingEnabled = true
           lineChart.minOffset = 0
           lineChart.setNeedsLayout()
//           lineChart.xAxis.spaceMin = 10
//           lineChart.xAxis.spaceMax = 2
//           lineChartView.moveViewToAnimated(xValue: xValue, yValue:Double(i), axis:.left, duration: 100)
           return lineChart
       }()
    
    
    
    lineChartView.delegate = self
    lineChartView.frame = CGRect(x: 0, y: 0, width:view.frame.size.width, height:view.frame.size.width)
    lineChartView.center = view.center
    lineChartView.dragEnabled = true
    
   
//               self.lineChartView.notifyDataSetChanged()
//               self.lineChartView.moveViewToX(Double(i))
   
    
    view.addSubview(lineChartView)
    
    
    
    var entries = [ChartDataEntry]()
    
        
//        for x in 0...20
//        {
//            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
//        }
        for i in chartarray1
        {
//            if i == chartarray1.last{
//                chartarray1 = []
//            }else{
//                let newDataEntry5 = ChartDataEntry(x: xValue,
//                                                   y: Double(i))
            entries.append(ChartDataEntry(x: xValue, y: Double(i)))
        
           
//            self.updateChartViewlead1(with: newEntry, dataEntries: &entries)
                xValue += 1
                
            //}
        
        
        
        let set = LineChartDataSet(entries: entries, label: "AVLCharts Ploting Data")
        set.colors = ChartColorTemplates.material()
        set.lineWidth = 3
        set.mode = .linear
        set.setColor(.white)
        set.drawCirclesEnabled = false
        set.fill = ColorFill.init(cgColor:.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5))
        set.fillAlpha = 0.8
        set.drawFilledEnabled = true
        set.setColor(.systemRed)
        set.mode = .cubicBezier
        set.drawHorizontalHighlightIndicatorEnabled = false
            
            
            
        let data = LineChartData(dataSet: set)
//        data.setDrawValues(false)
            
        lineChartView.data = data
            
            
//            lineChartView.moveViewToAnimated(xValue:xValue, yValue:Double(i), axis:AxisDependency., duration: 100)
          
    if lineChartView.data != nil
            {

                   lineChartView.setVisibleXRangeMaximum(100.0)
                    //self.lineChartView.moveViewToX(Double(50 + i))

                   print(data.entryCount)

                    let when = DispatchTime.now() + 5
                    DispatchQueue.main.asyncAfter(deadline: when){

                    lineChartView.moveViewToX(Double(50 + i))


                    }
        }
                
        }
    //previous page
    
   
    
    }
    func updateChartViewlead1(with newDataEntry: ChartDataEntry, dataEntries: inout [ChartDataEntry]) {
        
        
        if let oldEntry = dataEntries.first {
            
            dataEntries.removeFirst()
            lineChart.data?.removeEntry(oldEntry, dataSetIndex: 0)
        }
        
        
        dataEntries.append(newDataEntry)
        
        lineChart.data?.appendEntry(newDataEntry, toDataSet: 0)
        
        
        lineChart.notifyDataSetChanged()
        lineChart.moveViewToX(newDataEntry.x)
        
        
        
        
    }
    

    
    @IBAction func buttonAction(_ sender: UIButton) {
        if xValue != nil{
            xValue = 0
        }
                
        self.graphPlot()
    }
    
    
}


  
   

  
