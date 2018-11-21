using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour {

    Dictionary<string, Canvas> canvasDict = new Dictionary<string, Canvas>();

    const string PCCanvasName = "CanvasPC";
    const string iPadCanvasName = "CanvasiPad";
    const string iPhoneCanvasName= "CanvasiPhone678";

    // Use this for initialization
    void Start ()
    {
        PopulateCanvasDictonary();
        ShowPlatformCanvas();
    }

    void PopulateCanvasDictonary()
    {
        //Hide the canvases
        Canvas[] canvases = FindObjectsOfType<Canvas>();
        //Add them into our dict
        foreach (Canvas c in canvases)
        {
            canvasDict.Add(c.name, c);
            c.gameObject.SetActive(false);
        }

    }

    void ShowPlatformCanvas()
    {
        DeviceManager.Instance.RetrievePlatformInfo();

        switch (DeviceManager.Instance.platform)
        {
            case RuntimePlatform.WindowsPlayer:
            case RuntimePlatform.OSXPlayer:
            case RuntimePlatform.LinuxPlayer:
            case RuntimePlatform.WebGLPlayer:
                {
                    canvasDict[PCCanvasName].gameObject.SetActive(true);
                    Debug.Log("Show PC UI");
                    break;
                }
            case RuntimePlatform.IPhonePlayer:
                {
                    switch (DeviceManager.Instance.iOSDevice)
                    {
                        case UnityEngine.iOS.DeviceGeneration.iPad3Gen:
                        case UnityEngine.iOS.DeviceGeneration.iPad4Gen:
                        case UnityEngine.iOS.DeviceGeneration.iPad5Gen:
                        case UnityEngine.iOS.DeviceGeneration.iPadAir1:
                        case UnityEngine.iOS.DeviceGeneration.iPadAir2:
                            {
                                canvasDict[iPadCanvasName].gameObject.SetActive(true);
                                Debug.Log("Show iPad UI");
                                break;
                            }
                        default:
                            {
                                canvasDict[iPhoneCanvasName].gameObject.SetActive(true);
                                Debug.Log("Show iPhone UI");
                                break;
                            }
                    }
                    break;
                }
            default:
                {
                    canvasDict[PCCanvasName].gameObject.SetActive(true);
                    Debug.Log("Show PC UI");
                    break;
                }
        }
    }
}
