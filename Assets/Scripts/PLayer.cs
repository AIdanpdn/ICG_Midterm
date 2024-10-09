using System.Collections;
using System.Collections.Generic;
using UnityEditor.UI;
using UnityEngine;

public class PLayer : MonoBehaviour
{

    public Transform[] positions;
    private int i;

    // Start is called before the first frame update
    void Start()
    {
        i = 0;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.W))
        {
            i = i - 1;
            gameObject.transform.position = positions[i].position;
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            i = i + 1;
            gameObject.transform.position = positions[i].position;
        }
    }
}
