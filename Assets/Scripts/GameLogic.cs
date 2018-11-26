using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameLogic : MonoBehaviour {

    public Animator InventoryAnimator;
    public bool ShowInventory = false;
	// Use this for initialization
	void Start () {
		
	}

    public void ShowInventoryClicked()
    {
        ShowInventory = !ShowInventory;
        InventoryAnimator.SetBool("ShowPanel", ShowInventory);
    }
}
