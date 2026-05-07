# Execution Frameworks & Tools (May 2026)

2. Key Execution Frameworks and Repositories

The software required to orchestrate these models has diverged significantly from the early days of generative AI. As models scale beyond 10 billion parameters, dynamic memory management, node-based routing, and aggressive quantization have become the primary focus of active GitHub development.

2.1 Inference User Interfaces



2.2 Essential Custom Nodes and Training Frameworks

To harness uncensored models effectively, a user's ComfyUI installation must be heavily modified. Essential repositories include:

cubiq/ComfyUI_IPAdapter_plus: Essential for transferring character likeness, artistic styles, or specific compositions from a reference image directly into the generated output without requiring a full fine-tune.57

ltdrdata/ComfyUI-Impact-Pack: Critical for automated detailing in NSFW and complex workflows. It features detector nodes that identify faces, hands, or specific anatomical regions and route them to secondary KSamplers for localized upscaling and correction, effectively replicating ADetailer logic within a node graph.70

portu-sim/comfyui_bmab (BMAB): An advanced post-processing suite utilizing Grounding DINO to surgically detect and repair poorly rendered hands or limbs in complex scenes, supporting modern architectures like FLUX.71

kohya-ss/sd-scripts & bmaltais/kohya_ss: The industry standard for training LoRAs.72 Despite the rise of new architectures, Kohya's scripts remain the most efficient methodology to fine-tune models on consumer hardware. The GUI provided by bmaltais significantly lowers the barrier to entry, supporting Flux, SDXL, and newer DiT architectures for users looking to train bespoke characters or targeted de-censoring adapters.5