pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/access/Ownable.sol";

contract InteractiveDataVisualizationDashboard is Ownable {

    // Mapping of data points to their respective values
    mapping (string => int256) public dataPoints;

    // Mapping of data points to their respective visualization types
    mapping (string => string) public visualizationTypes;

    // Event emitted when a new data point is added
    event NewDataPointAdded(string dataPoint, int256 value);

    // Event emitted when a data point is updated
    event DataPointUpdated(string dataPoint, int256 newValue);

    // Event emitted when a visualization type is updated
    event VisualizationTypeUpdated(string dataPoint, string newType);

    // Function to add a new data point
    function addDataPoint(string memory _dataPoint, int256 _value) public onlyOwner {
        dataPoints[_dataPoint] = _value;
        emit NewDataPointAdded(_dataPoint, _value);
    }

    // Function to update a data point
    function updateDataPoint(string memory _dataPoint, int256 _newValue) public onlyOwner {
        dataPoints[_dataPoint] = _newValue;
        emit DataPointUpdated(_dataPoint, _newValue);
    }

    // Function to update a visualization type
    function updateVisualizationType(string memory _dataPoint, string memory _newType) public onlyOwner {
        visualizationTypes[_dataPoint] = _newType;
        emit VisualizationTypeUpdated(_dataPoint, _newType);
    }

    // Function to get a data point value
    function getDataPointValue(string memory _dataPoint) public view returns (int256) {
        return dataPoints[_dataPoint];
    }

    // Function to get a visualization type
    function getVisualizationType(string memory _dataPoint) public view returns (string memory) {
        return visualizationTypes[_dataPoint];
    }
}