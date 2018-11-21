using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.iOS;

public class DeviceManager : MonoBehaviour {

    public RuntimePlatform platform;
    public DeviceGeneration iOSDevice;

    private static object lockObj=new object();
    private static DeviceManager instance = null;

    public static DeviceManager Instance
    {
        get
        {
            lock(lockObj)
            {
                if (instance==null)
                {
                    instance = FindObjectOfType<DeviceManager>();
                    if (instance==null)
                    {
                        GameObject go = new GameObject
                        {
                            name = "DeviceManager"
                        };
                        instance = go.AddComponent<DeviceManager>();
                        DontDestroyOnLoad(go);
                    }
                }
                return instance;
            }
        }
    }

    public void RetrievePlatformInfo()
    {
        //Get and Store the platform
        platform = Application.platform;
        //We need to also store the iOS stuff, we should also consider doing something
        //broadly similar for Android
        if (platform == RuntimePlatform.IPhonePlayer)
        {
            iOSDevice = Device.generation;
        }
    }
}
